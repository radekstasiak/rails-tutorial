require 'rest-client'
require 'json'

class ApiTranslationController < BaseApiController

	def full_translation

		@word = params[:word]
		@sourceLang = params[:sl]
		@translateLang = params[:tl]
		RestClient.log = 'stdout'
		@test='at?dt=t'
		@response=RestClient.post('https://translate.googleapis.com/translate_a/single', 
								  {'client'=>'gtx',
								  'sl'=>@sourceLang,
								  'tl'=>@translateLang,
								  'dt'=>@test,
								  'q'=>@word}){|response, request, result, &block |

				case response.code
  					when 200
    				@jsonArray=response.body
    					while @jsonArray.include?(',,') or @jsonArray.include?('[,') or @jsonArray.include?(',]')
							puts(@jsonArray)
							@jsonArray.gsub!(',,',',"",')
							@jsonArray.gsub!(',]',',""]')
							@jsonArray.gsub!('[,','["",')
						end

					@result = JSON.parse(@jsonArray)
  						else
  						@result=response.code
    					end
		}

		
		render :json => {:type => @result}
		#render :json => {:translatedText => @jsonArray[0][0][0],
		#				 :originalText => @jsonArray[0][0][1],
		#				 :sourceLang => @jsonArray[2]}

	end

end