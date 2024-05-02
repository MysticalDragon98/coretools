# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]


### Added
- [2024-05-02T18:04:26] Added ~/.bin folder from BIN repository
- [2024-04-30T00:00:00] Ensure that the admin has permissions for the supervisord sock file
- [2024-04-30T00:00:00] Install supervisor ~/conf/supervisor folder to supervisor index
- [2024-04-29T00:00:00] Add make (Makefile) as dependency
- [2024-04-29T00:00:00] Add systat as dependency
- [2024-04-29T00:00:00] Add JQ as dependency
- [2024-04-29T00:00:00] Install after-login script at bash.bashrc
- [2024-04-29T00:00:00] Add scripts coretools to ~/.scripts
- [2024-04-29T00:00:00] Add `Coretools` installations
- [2024-04-29T00:00:00] Admin user is now allowed as sudoer
- [2024-04-28T00:00:00] Add NodeJS as default dependency
- [2024-04-28T00:00:00] Add support for snap & certbot
- [2024-04-28T00:00:00] Add autogeneration of .profile file when user is installed
- [2024-04-28T00:00:00] Add support for .bashrc if it doesnt exist
- [2024-04-28T00:00:00] Add admin user creation
- [2024-04-28T00:00:00] Add pretty print to the installations and init_fs processes
- [2024-04-28T00:00:00] Add filesystem initialization for vm folders
- [2024-04-28T00:00:00] Add build script that bundles the file into build/index.sh


### Changed
- [2024-04-29T00:00:00] Move folder structure to lib/
- [2024-04-28T00:00:00] Add Yarn & TSNode as default packages
- [2024-04-28T00:00:00] Admin's .bashrc is now created on BASE_PATH
- [2024-04-28T00:00:00] Changed init_fs from coretools to admin home

## [0.1.0] - 2024-04-28 (The Initial Update)
