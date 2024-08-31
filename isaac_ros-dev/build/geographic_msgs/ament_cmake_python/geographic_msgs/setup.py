from setuptools import find_packages
from setuptools import setup

setup(
    name='geographic_msgs',
    version='1.0.5',
    packages=find_packages(
        include=('geographic_msgs', 'geographic_msgs.*')),
)
