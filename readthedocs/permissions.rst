===========
User roles and permissions
===========

There are three roles in djangoCRM2 ( manager, boss and admin ). Each of them correlate to a business processes.
One **user** ( auth.User model ) account has one relationship to **sales person** record ( SalesPerson model ) and has one role.


Manager's role
-------------------------

It has permissions:

.. table::

    ================== ======= ============== ======== ========= ========== ===========
     Permission          User   Sales person   Todos    Reports    Clients    Products
    ================== ======= ============== ======== ========= ========== ===========
    Read any record     False       True        True    False       True       True
    Change any record   False       False       True    False       True       True
    Create any record   False       False       True    False       True       True
    Delete any record   False       False       True    False       True       True

    Read   own record   False       True        True    False       True       True
    Create own record   False       False       True    False       True       True
    Change own record   False       True        True    False       True       True
    Delete own record   False       False       True    False       True       True
    ================== ======= ============== ======== ========= ========== ===========

Boss's role
-------------------------

It has permissions:

.. table::

    ================== ======= ============== ======== ========= ========== ===========
     Permission          User   Sales person   Todos    Reports    Clients    Products
    ================== ======= ============== ======== ========= ========== ===========
    Read any record     False       True        True    False       True       True
    Change any record   False       False       True    False       True       True
    Create any record   False       False       True    False       True       True
    Delete any record   False       False       True    False       True       True

    Read   own record   False       True        True    False       True       True
    Create own record   False       False       True    False       True       True
    Change own record   False       True        True    False       True       True
    Delete own record   False       False       True    False       True       True
    ================== ======= ============== ======== ========= ========== ===========

Administrator's role
-------------------------

It has permissions:

.. table::

    ================== ======= ============== ======== ========= ========== ===========
     Permission          User   Sales person   Todos    Reports    Clients    Products
    ================== ======= ============== ======== ========= ========== ===========
    Read any record     False       True        True    False       True       True
    Change any record   False       False       True    False       True       True
    Create any record   False       False       True    False       True       True
    Delete any record   False       False       True    False       True       True

    Read   own record   False       True        True    False       True       True
    Create own record   False       False       True    False       True       True
    Change own record   False       True        True    False       True       True
    Delete own record   False       False       True    False       True       True
    ================== ======= ============== ======== ========= ========== ===========