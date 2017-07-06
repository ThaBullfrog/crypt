class CryptController < ApplicationController

  def home
    @crypt = Crypt.new
  end

  def process_text
    @crypt = Crypt.new(crypt_params)
    if(@crypt.valid?)
      if(params[:decrypt])
        @crypt.text = decrypt(@crypt.text)
      else
        @crypt.text = encrypt(@crypt.text)
      end
      render 'home'
    else
      render 'home'
    end
  end

  def encrypt(string)
    chars = string.split("")
    (0..(chars.length - 1)).each do |i|
      chars[i] = $e_hash[chars[i]] if $e_hash[chars[i]]
    end
    return chars.join
  end

  def decrypt(string)
    chars = string.split("")
    (0..(chars.length - 1)).each do |i|
      chars[i] = $d_hash[chars[i]] if $d_hash[chars[i]]
    end
    return chars.join
  end

  private

    def crypt_params
      return params.require(:crypt).permit(:text)
    end

end
