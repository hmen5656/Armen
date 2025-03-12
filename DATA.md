# GrowOff Module Data

| Data | Description | Flow | Timestamped | Status |
--- | --- | --- | --- | ---
| Commands | control plane | two-way (cloud request, device response), read-write | yes | Needs review |
| Metrics | regular time-series telemetry | one-way (device to cloud), read-only | yes | Done |
| Events | irregular time-series telemetry | one-way (device to cloud), read-only | yes | TBD |
| State | data plane | two-way (device-cloud sync), read-write | no (but state changes are) | TBD |


## Telemetry

"Telemetry is one-way, read-only data that is transmitted by the device and aggregated in the cloud. … Telemetry does not require an acknowledge message back from the MQTT broker…" (from _Designing MQTT Topics for AWS IoT Core_)

MQTT topic syntax:

    dt/growoff/<module_id>/<dt_type>

where `<dt_type>` is one of `metrics/sensors`, `events/watering`, `events/app`.

### Metrics

Metrics are time-series data, e.g. numeric sensor data, typically polled on a regular basis.

#### Sensors

| Key | Value | Comment |
--- | --- | ---
| `basement_air_humidity` | float (RH%) | |
| `basement_air_temperature` | float (°C) | |
| `irrigationtank_ec` | float (mS/cm) | |
| `irrigationtank_ph` | float | |
| `irrigationtank_temperature` | float (°C) | |
| `irrigationtank_top1_wet` | bool | |
| `irrigationtank_top2_wet` | bool | |
| `irrigationtank_bottom_wet` | bool | |
| `redadditivetank_bottom_wet` | bool | |
| `blueadditivetank_bottom_wet` | bool | |
| `phadjustertank_bottom_wet` | bool | |
| `floorF_P_wet` (F=1..5, P=1..6) | bool | |


### Events

Events are time-series (i.e. timestamped) data, linked directly to user actions, scheduled jobs, or real-world happenings, typically occuring on an irregular basis.

#### Watering

| Key | Value | Comment |
--- | --- | ---
| `floorF_P_watered_pressure` (F=1..5, P=1..6) | float | DEPRECATED |
| `floorF_P_watered_secs` (F=1..5, P=1..6) | float (sec) | DEPRECATED |
| `irrigationtank_filled_secs` | float (sec) | DEPRECATED |

#### App

| Key | Value | Comment |
--- | --- | ---
| `evt` | `app_begin` |  |
| `evt` | `watering_begin` | currently other fields include `"type"`, `"config_name"`, `"trays"` |
| `evt` | `watering_end` |  |
| `evt` | `growlights.py on` | DEPRECATED |
| `evt` | `growlights.py off` | DEPRECATED |
| `sch` | `growlights_on` |  |
| `sch` | `growlights_off` |  |


## State

State is data that can be changed, such as that of lights and switches.

State is not time-series data, but state changes are.

MQTT topic syntax:

    dt/growoff/<module_id>/<dt_type>

where `<dt_type>` is one of `state/lights`, `state/fans`, `state/cassettes`, `state/module`.

### Lights

| Key | Value | Comment |
--- | --- | ---
| `floorF_growlights_on` (F=1..5) | bool (r/w) | Floors 2 and 3 are wired together i.e. `AdafruitKits(1)` |
| `floorF_growlights_intensity` (F=1..5) | float (0.0–1.0) (r/w) | Floors 2 and 3 are wired together i.e. `AdafruitKits(1)` |

### Fans

| Key | Value | Comment |
--- | --- | ---
| `fan_on` | bool (r/w) | fan speed TBD |

### Cassettes

| Key | Value | Comment |
--- | --- | ---
| `floorF_P_filled` (F=1..5, P=1..6) | bool (r/w) |  |
| `floorF_P_plant` (F=1..5, P=1..6) | string (plant ID) (r/w) | TBD |

### Module Status

| Key | Value | Comment |
--- | --- | ---
| `emergency_stop` | bool (r/w) | Default is `false` |
| `watering_enabled` | bool (r/w) | Default is `false` |
| `sw_version` | string (r/o) | TBD |


## Commands

"Command topics are used to control a device remotely and to acknowledge successful command executions. Unlike telemetry, command topics are not read-only. Commands are a back and forth workflow that can occur between two devices or between the cloud and devices." (from _Designing MQTT Topics for AWS IoT Core_)

MQTT topic syntax:

    cmd/growoff/<module_id>/<req_type-or-res_type>

| Key | Value | Comment |
--- | --- | ---
| `act` | `doorlock_open` |  |
| `act` | `sensor_watering_protocol` |  |
| `act` | `manual_watering_protocol` |  |
| `act` | `irrigationtank_filling_protocol` |  |
| `act` | `ph_protocol` |  |
| `act` | `ec_protocol` |  |
| `act` | `test_inlet_start` |  |
| `act` | `test_inlet_stop` |  |
| `act` | `circulation_protocol_start` |  |
| `act` | `circulation_protocol_stop` |  |
| `act` | `DOOR_LOCK_1` | DEPRECATED |
| `act` | `doManualWatering` | DEPRECATED |
| `act` | `FILL_TANK` | DEPRECATED |
| `act` | `INLET_ON` | DEPRECATED |
| `act` | `INLET_OFF` | DEPRECATED |
| `act` | `MIXING_ON` | DEPRECATED |
| `act` | `MIXING_OFF` | DEPRECATED |
| `act` | `ADD_PH` | DEPRECATED |
| `act` | `ADD_EC` | DEPRECATED |
