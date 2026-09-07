class AddUserIdToPosts < ActiveRecord::Migration[7.0]
  def change
    # ruleid: ruby-rails-performance-indexes-are-beneficial
    add_column :posts, :user_id, :integer
  end
end

class AddAccountIdToOrders < ActiveRecord::Migration[7.0]
  def change
    # ruleid: ruby-rails-performance-indexes-are-beneficial
    add_column :orders, :account_id, :bigint
  end
end

class AddAuthorIdToBooks < ActiveRecord::Migration[7.0]
  def change
    # ruleid: ruby-rails-performance-indexes-are-beneficial
    add_column :books, :author_id, :integer
  end
end

class AddIndexedId < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :user_id, :integer
    # ok: ruby-rails-performance-indexes-are-beneficial
    add_index :comments, :user_id
  end
end

class AddNameColumn < ActiveRecord::Migration[7.0]
  def change
    # ok: ruby-rails-performance-indexes-are-beneficial
    add_column :posts, :title, :string
  end
end

class PlainMigration < ActiveRecord::Migration[7.0]
  def change
    # ok: ruby-rails-performance-indexes-are-beneficial
    add_column :posts, :views, :integer
  end
end
