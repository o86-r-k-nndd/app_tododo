# DB設計

## users table
ユーザー管理機能

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| name               | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |


### Association
_ has_many :genres

## genres table
ジャンル情報

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| text       | text       |                                |
| name       | string     | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association
_ belongs_to :user
_ has_many   :genre_tasks
_ has_many   :tasks, through: :genre_tasks


#  genre_tasks table
ジャンル_タスク中間テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| genre  | references | null: false, foreign_key: true |
| task   | references | null: false, foreign_key: true |

### Association
_ belongs_to :genre
_ belongs_to :task


## tasks table
タスク情報

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| text          | text       |                                |
| name          | string     | null: false                    |


### Association
_ has_many :genre_tasks
_ has_many :task_minitasks
_ has_many :genres, through: :genre_tasks
_ has_many :minitasks, through: :genre_tasks


#  task_minitasks table
タスク_ミニタスク中間テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| task     | references | null: false, foreign_key: true |
| minitask | references | null: false, foreign_key: true |

### Association
_ belongs_to :task
_ belongs_to :minitask


## minitasks table
ミニタスク情報

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| text          | text       |                                |
| name          | string     | null: false                    |
| timer         | references | null: false, foreign_key: true |


### Association
_ has_many :task_minitasks
_ has_many :tasks, through: :genre_tasks
_ has_one  :timer


## timers table
時間情報

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| time     | date       | null: false                    |
| day_id   | integer    | null: false                    |
| minitask | references | null: false, foreign_key: true |


### Association
_ belongs_to :minitask