# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]
### Fixed
- Set the correct headers to allow access from other domains

## [0.2.1]
### Changed
- Add returned status to `404` if record is not found
- Allow `on_query` class to return `nil` if record is not found
- Changed returned `json` to `{ details: <message_details> }` for malformed queries

## [0.2.0]
### Added
- Pass `StellarFederation::Query` to `.on_query` callback class

## [0.1.0]
### Added
- Initial commit


