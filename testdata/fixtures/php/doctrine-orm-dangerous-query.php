<?php
// QueryBuilder fragments built from request input escape the driver's
// quoting. Fragments with concatenation or sprintf flag; plain literals and
// prebuilt safe strings stay quiet.

function handle_orm($em, $id)
{
    $qb = $em->createQueryBuilder();
    // ruleid: doctrine-orm-dangerous-query
    $qb->where("t.id = " . $id);
    // ruleid: doctrine-orm-dangerous-query
    $qb->andWhere(sprintf("t.name = '%s'", $id));
    // ruleid: doctrine-orm-dangerous-query
    $qb->orderBy("t.id " . $id, "ASC");

    // ok: doctrine-orm-dangerous-query
    $qb->where("t.id = 1");
    // ok: doctrine-orm-dangerous-query
    $safe = "t.id = 1";
    $qb->where($safe);
}
