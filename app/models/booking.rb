class Booking < ApplicationRecord
	validates :slot_id, presence: true, uniqueness: true

	belongs_to :student, :class_name => 'User', :foreign_key => 'student_id'
	belongs_to :tutor, :class_name => 'User', :foreign_key => 'tutor_id'
	belongs_to :language
	belongs_to :slot

	before_create :generate_link
	before_validation :set_user
	
	def generate_link
		conn = Faraday.new(
		  url: 'https://api.videosdk.live/v1/meetings',
		  params: {param: '1'},
		  headers: {'Content-Type' => 'application/json', 'authorization' => 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlrZXkiOiI5N2E5OThiOS0xNDI2LTRmNzYtODBiOC02NmYyMjhmYTBiOGQiLCJwZXJtaXNzaW9ucyI6WyJhbGxvd19qb2luIl0sImlhdCI6MTY2ODUzMDgzMiwiZXhwIjoxNjY5MTM1NjMyfQ.UeXmf2w6KjvtqQLB733wnDG6a3O5rH2iJOsunQxycxw'}
		)
		response = conn.post do |req|
		  req.params['limit'] = 100
		  req.body = {region: 'sg001'}.to_json
		end
		response = JSON.parse(response.body)
		self.meeting_id = response["meetingId"]
		self.user_id = response["userId"]
		self.region = response["region"]
		self.video_id = response["id"]
	end

	def set_user
		self.student_id = Current.attributes[:user][:id]
	end
end