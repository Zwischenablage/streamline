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

  def getLabel session
    if session.requested? then  return "Label Label--orange" end
    if session.scheduled? then  return "Label bg-blue" end
    if session.feedback? then  return "Label bg-red" end
    if session.active? then  return "Label bg-green" end
    if session.closed? then  return "Label Label--gray" end
    return "Label Label--outline"
  end

  def getState session_state
    case session_state
      when :requested then return "State State--orange"
      when :scheduled then return "State State--blue"
      when :feedback  then return "State State--red"
      when :active then return "State State--green"
      when :losed then return "State State--gray"
      else return "State"
    end
  end

  def getStateOcticon session_state
    case session_state
      when :requested then return "bell"
      when :scheduled then return "watch"
      when :feedback  then return "zap"
      when :active then return "rocket"
      when :losed then return "shield"
      else return "question"
    end
  end

  def getStateCounter session_state
    case session_state
      when :requested then return "Counter Counter--orange-white"
      when :scheduled then return "Counter Counter--blue-white"
      when :feedback  then return "Counter Counter--red-white"
      when :active then return "Counter Counter--green-white"
      when :losed then return "Counter Counter--gray"
      else return "Counter"
    end
  end

  def getAnimationClass session_state
    case session_state
      when :requested then return "anim-fade-in"
      when :scheduled then return ""
      when :feedback  then return "anim-scale-in"
      when :active then return ""
      when :losed then return ""
      else return ""
    end
  end


end
