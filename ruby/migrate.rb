# 迁移字段
字段:precision => 8, :scale => 2 代表有数位数，小数点后有效位数.

	def self.up
		add_column :orders, :price, :decimal, :precision => 8, :scale => 2
		rename_column :orders, :email, :rename_email
		change_column :orders, :price, :string, :null => false
	end

#多个勾选框系列保存为1个字段 tags

  serialize :tags, Array

rails generate migration AddPartNumberToProducts part_number:string:index

rails generate migration RemovePartNumberFromProducts part_number:string

rails generate migration CreateProducts name:string part_number:string

rake db:migrate:redo STEP=3

rake db:migrate:up VERSION=20080906120000