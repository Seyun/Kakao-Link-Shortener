class KakaoLinksController < ApplicationController
  def home
    @kakao_link = KakaoLink.new

    @original = params[:original]
    encoded_id = params[:encoded_id]
    if encoded_id != nil
      @short_url = get_short_url(encoded_id)
    else
      @short_url = nil
    end

    render
  end

  def get_short_url(encoded_id)
    root_url + encoded_id
  end

  # GET /kakao_links
  # GET /kakao_links.xml
  def index
    @kakao_links = KakaoLink.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kakao_links }
    end
  end

  # GET /kakao_links/xui!xa
  def show
    @kakao_link = KakaoLink.find(:first, :conditions => {:encoded_id => params[:id]})
    redirect_to @kakao_link.original
  # respond_to do |format|
  # format.html # show.html.erb
  # format.xml  { render :xml => @kakao_link }
  # end
  end

  # GET /kakao_links/new
  # GET /kakao_links/new.xml
  def new
    @kakao_link = KakaoLink.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kakao_link }
    end
  end

  # GET /kakao_links/1/edit
  def edit
    @kakao_link = KakaoLink.find(params[:id])
  end

  # POST /kakao_links
  # POST /kakao_links.xml
  def create
    @kakao_link = KakaoLink.new(params[:kakao_link])

    link = get_kakao_link(@kakao_link.msg, @kakao_link.url, @kakao_link.appid, @kakao_link.appver)
    prev_kakao_link = KakaoLink.find(:first, :conditions => {:original => link})
    if prev_kakao_link != nil
    @kakao_link = prev_kakao_link
    else
      @kakao_link.original = link
      @kakao_link.save!
      @kakao_link.encoded_id = encode_id(@kakao_link.id)
    @kakao_link.save!
    end

    redirect_to :action => "home", :original => @kakao_link.original, :encoded_id => @kakao_link.encoded_id
  #
  # respond_to do |format|
  # if @kakao_link.save
  # format.html { redirect_to(@kakao_link, :notice => 'Kakao link was successfully created.') }
  # format.xml  { render :xml => @kakao_link, :status => :created, :location => @kakao_link }
  # else
  # format.html { render :action => "new" }
  # format.xml  { render :xml => @kakao_link.errors, :status => :unprocessable_entity }
  # end
  # end
  end

  def get_kakao_link (msg, url, appid, appver)
    link = "kakaolink://sendurl?msg="+msg+"&url="+url+"&appid="+appid+"&appver="+appver
    URI::escape(link)
  end
  
  SIX = ('0'..'9').to_a + ('a'..'z').to_a + ('A'..'Z').to_a
  
  def encode_id(i)
    
    
    if i == 0
      return '0'
    end
    
    s = ''
    while i > 0
      i,r = i.divmod(62)
      s = (SIX[r]) + s
    end
    s
  end
  
  # PUT /kakao_links/1
  # PUT /kakao_links/1.xml
  def update
    @kakao_link = KakaoLink.find(params[:id])

    respond_to do |format|
      if @kakao_link.update_attributes(params[:kakao_link])
        format.html { redirect_to(@kakao_link, :notice => 'Kakao link was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @kakao_link.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /kakao_links/1
  # DELETE /kakao_links/1.xml
  def destroy
    @kakao_link = KakaoLink.find(params[:id])
    @kakao_link.destroy

    respond_to do |format|
      format.html { redirect_to(kakao_links_url) }
      format.xml  { head :ok }
    end
  end
end
