class DiagnosesController < ApplicationController
  # GET /diagnoses
  # GET /diagnoses.xml
  def index
    return false unless authorize(permissions = ["view_diagnosis"])
    @diagnoses = Diagnosis.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @diagnoses }
    end
  end

  # GET /diagnoses/1
  # GET /diagnoses/1.xml
  def show
    return false unless authorize(permissions = ["view_diagnosis"])
    @diagnosis = Diagnosis.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @diagnosis }
    end
  end

  # GET /diagnoses/new
  # GET /diagnoses/new.xml
  def new
    return false unless authorize(permissions = ["create_diagnosis"])
    @diagnosis = Diagnosis.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @diagnosis }
    end
  end

  # GET /diagnoses/1/edit
  def edit
    return false unless authorize(permissions = ["edit_diagnosis"])
    @diagnosis = Diagnosis.find(params[:id])
  end

  # POST /diagnoses
  # POST /diagnoses.xml
  def create
    return false unless authorize(permissions = ["create_diagnosis"])
    @diagnosis = Diagnosis.new(params[:diagnosis])

    respond_to do |format|
      if @diagnosis.save
        flash.now[:notice] = 'Diagnosis was successfully created.'
        format.html { redirect_to(@diagnosis) }
        format.xml  { render :xml => @diagnosis, :status => :created, :location => @diagnosis }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @diagnosis.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /diagnoses/1
  # PUT /diagnoses/1.xml
  def update
    return false unless authorize(permissions = ["edit_diagnosis"])
    @diagnosis = Diagnosis.find(params[:id])

    respond_to do |format|
      if @diagnosis.update_attributes(params[:diagnosis])
        flash.now[:notice] = 'Diagnosis was successfully updated.'
        format.html { redirect_to(@diagnosis) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @diagnosis.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /diagnoses/1
  # DELETE /diagnoses/1.xml
  def destroy
    return false unless authorize(permissions = ["delete_diagnosis"])
    @diagnosis = Diagnosis.find(params[:id])
    @diagnosis.destroy

    respond_to do |format|
      format.html { redirect_to(diagnoses_url) }
      format.xml  { head :ok }
    end
  end
end
