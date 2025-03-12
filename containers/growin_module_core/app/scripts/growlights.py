import click
from growoff import datalog
from growoff.mvp import grow_lights


@click.group()
def cli():
    pass


@cli.command()
def off():
    datalog.event(
        "growlights.py off",
        {"src": "scripts/growlights.py"},
    )
    grow_lights.light_off()


@cli.command()
def on():
    datalog.event(
        "growlights.py on",
        {"src": "scripts/growlights.py"},
    )
    grow_lights.light_on()


if __name__ == "__main__":
    cli()
