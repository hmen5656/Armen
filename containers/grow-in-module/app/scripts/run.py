import logging
import signal
import threading
import time
import signal
from growoff import datalog, settings
from growoff.mvp import schedule
from growoff.mvp.config_states import (
    datalog_post_filled_trays,
    is_emergency,
    is_water_enabled,
    is_watering,
    update_config_status,
    is_inlet_open, 
    is_nutrient_running, 
    is_ph_running
)
from growoff.vivasoft.glue import collect_sensor_data

logger = logging.getLogger(__name__)

def handle_pdb(sig, frame):
    import pdb
    pdb.Pdb().set_trace(frame)   

def _collect_metrics_main():
    datalog_post_filled_trays()
    while True:
        if not is_watering() and not is_ph_running() and not is_nutrient_running() and not is_inlet_open():
            emergency_stop = is_emergency()
            watering_enabled = is_water_enabled()

            datalog.metrics(
                "state",
                {
                    "emergency_stop": emergency_stop,
                    "watering_enabled": watering_enabled,
                },
            )

            if not emergency_stop:
                update_config_status("is_collecting_data", True)
                collect_sensor_data()
                update_config_status("is_collecting_data", False)
        else:
            pass
        time.sleep(settings.COLLECT_DATA_TIME_INTERVAL)


def handle_pdb(sig, frame):
    import pdb

    pdb.Pdb().set_trace(frame)


def main():
    logger.info("Starting app")
    datalog.event("app_begin")

    _collect_metrics_thread = threading.Thread(target=_collect_metrics_main)
    _collect_metrics_thread.daemon = True
    _collect_metrics_thread.start()

    signal.signal(signal.SIGUSR1, handle_pdb)

    schedule.main()


if __name__ == "__main__":
    main()
