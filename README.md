# spring-rocketmq-mysql-transaction-integration

spring boot
rocketmq
mysql
integration rocketmq , mysql and database transaction.

## rocketmq distributed trasactional message

![](_images/40928949-a6e0b728-6855-11e8-863e-f69faa80e4f5.png)

* 1 Producer send half message to MQ server.
* 2 After send half message succeed, execute local transaction.
* 3 Send commit or rollback message to MQ Server based on local transaction results.
* 4 If commit/rollback message missed or producer pended during the execution of local transaction，MQ server will send check message to each producers in the same group to obtain transaction status.
* 5 Producer reply commit/rollback message based on local transaction status.
* 6 Committed message will be delivered to consumer but rolled back message will be discarded by MQ server.

Sending transactional message:

![](_images/0D676A08-0A84-4D58-AE72-D114EF5A9AA3.png)

Checking transactional message:
![](_images/CE39DE3C-6093-40D4-978C-8AFAE1A0E5E5.png)

We can get some introduce from [here](https://rocketmq.apache.org/rocketmq/the-design-of-transactional-message/)