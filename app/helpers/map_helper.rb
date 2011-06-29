module MapHelper

  def get_start_address_from_result
    @search_result["routes"][0]["legs"][0]["start_address"]
  end

  def get_end_address_from_result
    @search_result["routes"][0]["legs"][0]["end_address"]
  end

  def get_distance_from_result
    @search_result["routes"][0]["legs"][0]["distance"]["text"]
  end

  def get_duration_from_result
    @search_result["routes"][0]["legs"][0]["duration"]["text"]
  end

  def get_steps_from_result
    @search_result["routes"][0]["legs"][0]["steps"]
  end
  
  def make_instruction_from(step)
    instruction = "[#{pluralize(step["distance"]["value"], "meter")}] "
    instruction += "[#{pluralize(step["duration"]["value"], "second")}] "
    instruction += step["html_instructions"]
  end
end
