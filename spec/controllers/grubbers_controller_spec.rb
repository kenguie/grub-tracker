require 'rails_helper'

RSpec.describe GrubbersController, :type => :controller do

	let(:valid_attributes) {
		@valid_attributes = {
			mobile: "312-234-2345",
			email: "A@a.com",
			password: "12345"
		}
	}

	let(:invalid_attributes) {
		@invalid_attributes = {
			mobile: nil,
			email: nil,
		}
	}

	describe "GET new" do
		it "assigns a new grubber as a Grubber" do
			get :new, {}, valid_attributes
			expect(assigns(:grubber)).to be_a_new(Grubber)
		end
	end

	describe "POST create" do
		describe "with valid params" do
			it "creates a new grubber" do
				expect {
					post :create, {grubber: valid_attributes}
				}.to change(Grubber, :count).by(1)
			end
		end

		it "assigns a new grubber as @grubber" do
			post :create, {grubber: valid_attributes}
			expect(assigns(:grubber)).to be_a(Grubber)
			expect(assigns).to be_persisted
		end
	end

end