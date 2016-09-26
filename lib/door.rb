
class Door

  attr_reader :open, :unlocked, :inscription
  def initialize
    @open = false
    @unlocked = false
    @inscription = nil
  end

  def open_door
    if @open == true
      raise StandardError ('Door is already open!')
    elsif @unlocked == false
      raise StandardError ('This door is locked. Unlock and try again!')
    end
    @open = true
  end

  def close_door
    if @open == false
      raise StandardError ('Door already closed!')
    end
    @open = false
  end

  def unlock_door
    if @unlocked == true
      raise StandardError ('Door already unlocked!')
    end
    @unlocked = true
  end

  def lock_door
    if @unlocked == false
      raise StandardError ('Door already locked!')
    elsif @open == true
      raise StandardError ("There is no point in locking an open door, therefore you cannot lock this one.")
    end
    @unlocked = false
  end

  def read_inscription
    if @inscription == nil
      return ""
    end
    @inscription
  end

  def write_inscription(new_inscription)
    if @inscription != nil
      raise StandardError ('Door already written on!')
    end
    @inscription = new_inscription
  end

end
