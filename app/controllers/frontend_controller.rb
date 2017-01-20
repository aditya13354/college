class FrontendController < ApplicationController
  layout 'college/base', except: :home

  def home
    @title = 'Home'
    @sliders = Admin::Slider.order(updated_at: :desc).limit(5)
    @newses = Admin::News.order(updated_at: :desc).limit(3)
    @website = Admin::Website.last
    render layout: 'college/home'
  end

  def noticeboard
    @title = 'Notice Board'
    @notices = Admin::NoticeBoard.order(updated_at: :desc)
  end

  def about
    @title = 'About us'
    @about = Admin::About.last
  end

  def admission_eligibility
    @title = 'Admission Eligibility'
    @admission_eligibilities = Admin:: AdmissionEligibility.order(updated_at: :desc)
  end

  def tuition_fees
    @title = 'Tuition Fees'
    @tuition_fees_group = Admin::TuitionFeesGroup.all
  end

  def scholarships
    @title = 'Scholarship'
    @scholarship_groups = Admin::ScholarshipGroup.all
  end

  def how_to_apply
    website_name =Admin::Website.last.name
    @title = 'How to Apply in ' + website_name.to_s
    @admission_process = Admin::AdmissionProcess.all

  end

  def courses
    @course = Admin::Course.find(params[:id])
    @title = @course.name
  end

  def news
    @title = 'News'
    @newses = Admin::News.order(updated_at: :desc).limit(7)
  end
  def news_details
    @news = Admin::News.find(params[:id])
   # @news = Admin::News.last
    @title = @news.name
  end
  def event
    @title = 'Events'
    @events = Admin::Event.order(updated_at: :desc).limit(10)
  end

  def contact
    @title = 'Contact'
    @map = Admin::GoogleMap.last
  end
end
