class User < ActiveRecord::Base
    has_secure_password

    def mood
        #returns 'sad' when the user is more nauseous than happy
        #returns 'happy' when the nausea < = happiness
    
        if self.nausea > self.happiness
          mood = "sad"
        else
          mood = "happy"
        end
      end
end
