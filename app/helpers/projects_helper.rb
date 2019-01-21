module ProjectsHelper
  def isActiveTab tabName, isDefault = false
    if @active_tab.present?
      if @active_tab == tabName
        puts "1"
        return "selected"
      else
        puts "2"
        return " "
      end
    else
      puts "3"
      if isDefault
        return "selected"
      else
          puts "5"
          return " "
      end
    end
  end

  def getCounter session_type
    # result = "<span class=\"Counter\">2</span>"
    content_tag(:span, @project.sessions.where(session_type: session_type).size, class:"Counter")
  end

  def getOcticon session_type
    case session_type
    when :Porting
      return "tools"
    when :APQM
      return "verified"
    when :Tuning
      return "unmute"
    end
  end
end
