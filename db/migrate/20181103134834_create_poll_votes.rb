class CreatePollVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :poll_votes do |t|
      t.references :user, foreign_key: true, index: true
      t.references :vote_option, foreign_key: true, index: true

      t.timestamps
    end
    
    add_index :poll_votes, [:vote_option_id, :user_id], unique: true
  end
end
