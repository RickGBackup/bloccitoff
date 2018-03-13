desc "This task called by the Heroku scheduler add-on.  Delete items older than seven days"
task delete_items: :environment do
  Item.where("created_at <=?", Time.now - 7.days).destroy_all  
end

