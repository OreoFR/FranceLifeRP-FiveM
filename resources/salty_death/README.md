# [Salty] Death
Adds protection against combat logging by saving death status to the database.

## Requirements
Base Events, EssentialMode Extended, MySQL Async.

## Instructions
Download the folder, modify the database, start the resource. 
The resource needs to be started after es_extended and baseevents.

## Database Modification
```
ALTER TABLE `users` ADD `isDead` INT NOT NULL DEFAULT '0' AFTER `name`;
```
