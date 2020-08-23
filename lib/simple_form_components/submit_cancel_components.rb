module SubmitCancelComponents
  # To avoid deprecation warning, you need to make the wrapper_options explicit
  # even when they won't be used.
  def submit_cancel(*args, &block)
    template.content_tag :div, class: 'mt-8 border-t border-gray-200 pt-5' do
      template.content_tag :div, class: 'flex justify-end' do
        options = args.extract_options!
        options[:class] = [options[:class], 'inline-flex justify-center py-2 px-4 border border-transparent text-sm leading-5 font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-500 focus:outline-none focus:border-indigo-700 focus:shadow-outline-indigo active:bg-indigo-700 transition duration-150 ease-in-out'].compact
        args << options

        submit_btn = template.content_tag :span, class: 'ml-3 inline-flex rounded-md shadow-sm' do
          submit(*args, &block)
        end


        if cancel_link = options.delete(:cancel)
          cancel_btn = template.content_tag :span, class: 'inline-flex rounded-md shadow-sm' do
            template.link_to("Cancel", cancel_link, class: 'py-2 px-4 border border-gray-300 rounded-md text-sm leading-5 font-medium text-gray-700 hover:text-gray-500 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue active:bg-gray-50 active:text-gray-800 transition duration-150 ease-in-out')
          end
        end

        [cancel_btn, submit_btn].join.html_safe
      end
    end
  end
end

SimpleForm::FormBuilder.include(SubmitCancelComponents)
