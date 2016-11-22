require 'rest-client'
require 'json'

class ApiTranslationController < BaseApiController
	
	def full_translation
		@word = params[:word]
		@sourceLang = params[:sl]
		@translateLang = params[:tl]

		@response=RestClient.post('https://translate.googleapis.com/translate_a/single', {'client'=>'gtx','sl'=>@sourceLang,'tl'=>@translateLang,'dt'=>'t','q'=>@word})
		puts(@response)
		@result=@response.body
		puts(@result)
		while @result.include?(',,')
			puts(@result)
			@result.gsub!(',,',',"",')
		end

		@jsonArray = JSON.parse(@result)
		render :json => {:translatedText => @jsonArray[0][0][0],
						 :originalText => @jsonArray[0][0][1],
						 :sourceLang => @jsonArray[2]}

	end

end