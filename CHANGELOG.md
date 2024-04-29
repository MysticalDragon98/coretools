# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]


### Added
- [2024-04-29] Admin user is now allowed as sudoer
- [2024-04-28] Add NodeJS as default dependency
- [2024-04-28] Add support for snap & certbot
- [2024-04-28] Add autogeneration of .profile file when user is installed
- [2024-04-28] Add support for .bashrc if it doesnt exist
- [2024-04-28] Add admin user creation
- [2024-04-28] Add pretty print to the installations and init_fs processes
- [2024-04-28] Add filesystem initialization for vm folders
- [2024-04-28] Add build script that bundles the file into build/index.sh


### Changed
- [2024-04-29] Move folder structure to lib/
- [2024-04-28] Add Yarn & TSNode as default packages
- [2024-04-28] Admin's .bashrc is now created on BASE_PATH
- [2024-04-28] Changed init_fs from coretools to admin home

## [0.1.0] - 2024-04-28 (The Initial Update)
