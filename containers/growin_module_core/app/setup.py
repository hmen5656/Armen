from setuptools import setup

setup(
    name="growinmodule",
    version="0.0.1",
    author_email="hmen5634@gmail.com",
    packages=["growin"],
    py_modules=["app", "main"],
    install_requires=["python-dotenv"],
    entry_points="""
        [console_scripts]
        growinctl=main:cli
    """,
)
