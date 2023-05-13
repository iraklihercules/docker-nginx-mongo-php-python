<?php

use MongoDB\Driver\Query;
use MongoDB\Driver\Manager;
use MongoDB\Driver\BulkWrite;
use MongoDB\BSON\UTCDateTime;

function getUsersFromDB(Manager $manager, string $collection): array
{
    $filter = ['username' => 'John Doe'];
    $options = ['limit' => 1];
    $query = new Query($filter, $options);
    $cursor = $manager->executeQuery($collection, $query);
    return $cursor->toArray();
}

const DATABASE = 'hercules_database';
const USERNAME = 'test';
const PASSWORD = 'test';

$manager = new Manager('mongodb://mongo:27017', ['username' => USERNAME, 'password' => PASSWORD]);
$collection = DATABASE.'.User';

/* Get users */
$users = getUsersFromDB($manager, $collection);

if (empty($users)) {
    /* Insert users if the result is empty */
    $bulkWrite = new BulkWrite;
    $bulkWrite->insert([
        'username' => 'John Doe',
        'email' => 'john.doe@example.com',
        'createdAt' => new UTCDateTime,
    ]);
    $bulkWrite->insert([
        'username' => 'Foo Bar',
        'email' => 'foo.bar@example.com',
        'createdAt' => new UTCDateTime,
    ]);
    $manager->executeBulkWrite($collection, $bulkWrite);

    /* Get users again */
    $users = getUsersFromDB($manager, $collection);
}

/* Display the first user */
echo '<pre>';
$user = $users[0];
print_r([
    'username' => $user->username,
    'email' => $user->email,
    'created_at' => $user->createdAt->toDateTime()->format('Y-m-d H:i'),
]);
echo '</pre>';
