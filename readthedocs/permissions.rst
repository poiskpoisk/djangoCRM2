===========
User roles and permissions
===========

There are three roles in djangoCRM2 ( manager, boss and admin ). Each of them correlate to a business processes.
One **user** ( auth.User model ) account has one relationship to **sales person** record ( SalesPerson model ) and has one role.


Manager's role
-------------------------

It has permissions:

.. table::

    ================== ======= ============== ========
     Permission          User   Sales person   Deals
    ================== ======= ============== ========
    Read any record     False       True        True
    Change any record   False       False       False
    Create any record   False       False       False
    Delete any record   False       False       False

    Read   own record   False       True        True
    Create own record   False       False       True
    Change own record   False       True        True
    Delete own record   False       False       True
    ================== ======= ============== ========
