class TextInput < SimpleForm::Inputs::TextInput
  def input(wrapper_options)
    template.content_tag(:div, class: 'mt-1 sm:mt-0 sm:col-span-2') do
      template.content_tag(:div, class: 'max-w-lg flex rounded-md shadow-sm') do
        input_html_options[:rows] ||= 3
        super
      end
    end
  end

  def input_html_classes
    super.push('form-textarea block w-full transition duration-150 ease-in-out sm:text-sm sm:leading-5')
  end
end
