class DateTimeInput < SimpleForm::Inputs::DateTimeInput
  def input(wrapper_options)
    template.content_tag(:div, class: 'mt-1 sm:mt-0 sm:col-span-2') do
      template.content_tag(:div, class: 'max-w-lg rounded-md shadow-sm sm:max-w-xs') do
        super
      end
    end
  end

  def input_html_classes
    super.push('form-input block w-full transition duration-150 ease-in-out sm:text-sm sm:leading-5')
  end
end
