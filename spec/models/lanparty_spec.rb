require 'rails_helper'

RSpec.describe Lanparty, type: :model do
  it "is saved with name, address and city" do
  	party = Lanparty.new partyname:"Tykittelyt", address: "Tykityskatu 1", city: "Tykkilä", startdate: '2017-03-03', enddate: '2017-03-04'
  	expect(party.partyname).to eq("Tykittelyt")
  end
end
