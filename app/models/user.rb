class User < ActiveRecord::Base
    has_secure_password
    validates_presence_of :password_digest

    has_many :rides
    has_many :attractions, through: :rides

    def mood
        #Returns 'sad' if nausea > happiness
        #Returns 'happy' if nausea < happiness

        if self.happiness > self.nausea
            return 'happy'
        else
            return 'sad'
        end
    end
end
