DROP TABLE IF EXISTS task_define;
/*
 * Table: task_define 任务定义表
 */
create table task_define  (
	Task_Group						VARCHAR(100)			not null,
	Task_ID							VARCHAR(100)			not null,
	Task_Version					VARCHAR(10)				not null,
	Task_Name						VARCHAR(100)					,
	Task_Description				VARCHAR(300)					,
	Task_Type						VARCHAR(1)	default '1'	not null,
	Task_Max_Expense_Time			VARCHAR(15)	default '-1',
	Task_Concurrent_Flag			VARCHAR(1)	default '0',
	Task_Recovery_Flag				VARCHAR(1)	default '0',
	Task_Biz_Type           	 	VARCHAR(1)	default '1' not null,
	Task_Execute_Class_Name			VARCHAR(100)			not null,
	Task_Biz						VARCHAR(100)					,
	Task_Schedule_Effective_Time	VARCHAR(20)						,
	Task_Expression					VARCHAR(300)			not null,
	Task_Workday_Execute			VARCHAR(1)						,
	Task_Holiday_Execute			VARCHAR(1)						,
	Task_State						VARCHAR(1)				not null,
	Task_Log_RunStatus_History		VARCHAR(1)	default '1'			,
	Task_Last_Run_ServerIp			VARCHAR(20)						,
	Task_Last_Start_Time			VARCHAR(20)						,
	Task_Last_End_Time				VARCHAR(20)						,
	Task_Run_Times					integer(10)	default 0,
	Task_Warn_Times					integer(10)	default 0,
	Task_Exception_Times			integer(10)	default 0,
	primary key (Task_Group, Task_ID, Task_Version)
);

DROP TABLE IF EXISTS task_run_status_history;
/*
 * Table: task_run_status_history 任务历史状态记录
 */
create table task_run_status_history  (
   Serial_No          VARCHAR(50)                    not null,
   Task_Group         VARCHAR(100)                   not null,
   Task_Id            VARCHAR(100)                   not null,
   Task_From_Status   VARCHAR(10)                    		,
   Task_End_Status    VARCHAR(10)                    not null,
   Task_Start_Change_Description VARCHAR(100)        default '1' not null,
   Task_Execute_Server_Ip VARCHAR(30)                not null,
   Task_Status_Change_Time VARCHAR(20)              not null,
   primary key (Serial_No)
);

drop TABLE IF EXISTS server_forbid_tasks;
/*
 * Table: server_forbid_tasks 集群某节点上禁止运行的任务
 */
create table server_forbid_tasks(
   Task_Group         VARCHAR(100)                   not null,
   Task_Id            VARCHAR(100)                   not null,
   Task_Forbid_Server_Ip VARCHAR(30)                 not null,
   primary key (Task_Group, Task_Id, Task_Forbid_Server_Ip)
);

DROP TABLE IF EXISTS running_task_record;
/*
 * Table: running_task_record 本表记录所有正在运行的任务
 */
create table running_task_record  (
   Task_Serial_No     VARCHAR(100)                    not null,
   Task_Group         VARCHAR(100)                   not null,
   Task_Id            VARCHAR(100)                   not null,
   Task_Execute_Server_Ip VARCHAR(30)                    not null,
   constraint PK_running_task_record primary key (Task_Serial_No)
);