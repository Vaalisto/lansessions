require 'rails_helper'

RSpec.describe Lanparty, type: :model do
  it "is saved with name, address and city" do
  	party = Lanparty.new partyname:"Tykittelyt", address: "Tykityskatu 1", city: "Tykkilä", startdate: '2017-03-03', enddate: '2017-03-04'
  	expect(party.partyname).to eq("Tykittelyt")
  end

  it "start_time is correct" do
  	party = Lanparty.new partyname:"Tykittelyt", address: "Tykityskatu 1", city: "Tykkilä", startdate: '2017-03-03', enddate: '2017-03-04' 
  	expect(party.start_time).to eq('2017-03-03 00:00:00.000000000 +0200')
  end

  it "end_time is correct" do
  	party = Lanparty.new partyname:"Tykittelyt", address: "Tykityskatu 1", city: "Tykkilä", startdate: '2017-03-03', enddate: '2017-03-04' 
  	expect(party.end_time).to eq('2017-03-04 00:00:00.000000000 +0200')
  end

  it "address_line is correct" do
  	party = Lanparty.new partyname:"Tykittelyt", address: "Tykityskatu 1", city: "Tykkilä", startdate: '2017-03-03', enddate: '2017-03-04' 
  	expect(party.address_line).to eq('Tykityskatu%201%20Tykkil%C3%A4')
  end
end
