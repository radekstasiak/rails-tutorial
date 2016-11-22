require 'rest-client'

class ApiTranslationController < BaseApiController

	def full_translation
		@word = params[:word]
		@sourceLang = params[:sl]
		@translateLang = params[:tl]
		puts(@type)
		puts(@word)
		puts(@sourceLang)
		puts(@translateLang)
		@response=RestClient.post('https://translate.googleapis.com/translate_a/single', {'client'=>'gtx','sl'=>@sourceLang,'tl'=>@translateLang,'dt'=>'t','q'=>@word})
		render :json => {:type => @response.to_json}
	end

end