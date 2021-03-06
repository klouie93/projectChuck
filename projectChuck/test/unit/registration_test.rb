require 'test_helper'

class RegistrationTest < ActiveSupport::TestCase

	#relationship validations
	should belong_to(:student)
	should belong_to(:team)

	# test active
	should allow_value(true).for(:active)
	should allow_value(false).for(:active)
	should_not allow_value(nil).for(:active)

	#test student_id
	should validate_numericality_of(:student_id)
	should_not allow_value(3.14159).for(:student_id)
	should_not allow_value(0).for(:student_id)
	should_not allow_value(-1).for(:student_id)

	#test team_id
	should validate_numericality_of(:team_id)
	should_not allow_value(3.14159).for(:team_id)
	should_not allow_value(0).for(:team_id)
	should_not allow_value(-1).for(:team_id)

	#test physical

	#test physical date
	should_not allow_value(2.years.ago.to_date).for(:physical_date)
	#not sure about this, we need to check how recent physicals must be
	should allow_value(1.year.ago.to_date).for(:physical_date)
	should allow_value(8.months.ago.to_date).for(:physical_date)
	should_not allow_value(1.month.from_now).for(:physical_date)
	should_not allow_value("bad").for(:physical_date)

	#test proof_of_insurance

	#test report_card

	#test t_shirt_size
	#note that size 0=small, size 5=xxxl
	should validate_numericality_of(:t_shirt_size)
	should allow_value(0).for(:t_shirt_size)
	should allow_value(5).for(:t_shirt_size)
	should_not allow_value(-1).for(:t_shirt_size)
	should_not allow_value(6).for(:t_shirt_size)
	should_not allow_value(nil).for(:t_shirt_size)
	should_not allow_value("small").for(:t_shirt_size)

end
