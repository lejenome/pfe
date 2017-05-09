# PLAN #

What to Present:

- Academy
- Startup
- Specific solutions
  1. Transport solutions
  2. Data (potholes/speed bumps/speed/...) collection
  3. Public interest solutions (media, ...)
  4. Data (user behavior) collection
  5. User profiling
  6. Data analysis and consulting
- Scrum

N1: tech
BI / SSIS
Android / Sensors / GPS
Google API

N2: BI
integration
upload

## Document Scrum ##

- iter 0:
  - preparation
  - genaral
  - cadre du project
    - Djagora academy
    - geographi du projet
    - equipe
  - Backlog du project
  - Tech utilisés:
    - RESTful
    - OAuth2
    - GIS extensions
    - PHP
    - Laravel/Lumen

- iter 1:
  - 3 week
  - iter goal
  - ...
  - integration

- apps multi-couche
- image descriptive, workflow (General of all teams, then specific)

**Webservices Presentation**:

- DB concept, ORM
- API arch
- GET/POST/PUT
- OAuth2 / Permissions / Scopes
- MVC ? (Model, Controller, ) / Patterns?
- GeoJSON, KML, ...
- GIS extensions/libs
- Pue PHP then framework (Laravel)
- unit testing / phpunit
- dotfiles/setup/automatization files, phpdoc/apidoc

- Data reducing  & Optimization
- Map pos to road

data size estimation to n TB on 1 mill users and x roads

## Sprints ##

### Sprint 1 ###

- DB Concept
- Post Position
- Get Position
- Get Erros
- Header Last-Modified
- Header Access-Control-Allow-Origin
- Unit Testing (Error, Position, Common)
- Docs (phpdoc, apidoc)
- Linting (phplint, phpcbf)

### Sprint 2 ###

- Laravel Framework
- ORM
- Devices API
  - Get Devices
  - Get Device
  - Post Device
- Param since
- Header Last-Modified
- Header Access-Control-Allow-Origin
- Photo API
  - Put Image
  - Get Image
  - Param h, w, f
- Position API
- Pothole API
- Speedbump API
- Report API
  - Gestion des Reports
- Trace API
  - GeoJSON, KML
  - Gestion du Trace History
- Auto Upload/Deploy Script
- Traffic Path Reduction Algos
- Mapping positions to road
- Dynamic Server Configuration API
- Delete Image on delay

### Sprint 3 ###

- Feedback API
  - Post Feedback
  - Email Feedback
- PhoneSignal API
- User API
- OAuth2
- User Permissions
- Scopes
- Traffic API ?
- BI integration ?
  - Export to Bi
  - Traffic API using BI results
- User Ranking
- Data Mining
