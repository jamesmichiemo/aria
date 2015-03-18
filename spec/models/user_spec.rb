require 'rails_helper'
require 'rspec/its'

RSpec.describe User, :type => :model do
  subject(:user) { User.new(name: 'Ash Clone 1', username: 'ashclone1', favorites: [favorite1, favorite2]) }
  let(:favorite1) { Favorite.new }
  let(:favorite2) { Favorite.new }

  describe User do

    # it 'is invalid without a name' do
    #   should_not be_valid
    # end

    it { should_not be_valid if subject.name.nil?}

    # it "has a name that matches 'Ash Clone'" do
    #   user = User.new(name: "Ash Clone 1")
    #   user.name.should match(/Ash Clone \d/)
    # end

    # its
    its(:name) { should match(/Ash Clone \d/) }


    # it "has a username that matches 'ashclone'" do
    #   user = User.new(username: "ashclone")
    #   user.username.should match(/ashclone/)
    # end

    its(:username) { should match(/ashclone\d/) }

    # it 'include favorite' do
    #   favorite1 = Favorite.new(user_id: 1, track_id: 001)
    #   favorite2 = Favorite.new(user_id: 2, track_id: 002)
    #   user = User.new(name: 'Ash', favorites: [favorite1, favorite2])
    #   user.favorites.should include(favorite1)
    #   user.favorites.should include(favorite2)
    # end

    its(:favorites) { should include(favorite2) }
    its(:favorites) { should include(favorite1) }

    

   #  it 'starts with zero favorites' do
   #    user = User.new(name: 'Ash', favorites: [])
   #    user.favorites.count.should == 0
   # #  user.should have(0).favorites
   #              # have_at_least(n)
   #              # have_at_most(n)
   # # *** not working ***
   #  end

    its('favorites.size') { should == 2 }

    it 'changes the number of users' do
      user = User.new(name: 'Ash')
      expect { user.save }.to change { User.count }.by(1)
    end

    # implicit receiver
    # it 'responds to name' do
    #   subject.should respond_to(:name)
    # end

    # it 'responds to name' do
    #   should respond_to(:name)
    # end

    it { should respond_to(:name) }

  end
end
