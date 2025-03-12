from setuptools import setup

setup(
    name="growoffmodule",
    version="0.1",
    author_email="john@gronska.org",
    packages=["growoff"],
    py_modules=["app", "main"],
    install_requires=["python-dotenv"],
    entry_points="""
        [console_scripts]
        growoffctl=main:cli
    """,
)
