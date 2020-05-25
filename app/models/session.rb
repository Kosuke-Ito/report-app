class Session
    include ActiveModel::Model

    attr_accessor :name, :password

    validates :name, presence: true
    validates :password, presence: true
    validate  :true_name
    validate  :true_password


   def true_name
       errors.add(:name, "は存在しません。") unless User.find_by(name: name)
   end

   def true_password
       @user = User.find_by(name: name)
       if @user
         unless @user.authenticate(password)
           if password.length < 4
             errors.add(:password, "が短すぎます。")
           else
             errors.add(:password, "が正しくありません。")
           end
         end
       else
           errors.add(:password, "が正しくありません。")
       end
   end

   def save
       return false if invalid?
       true
   end
end
