module BreadcrumbsHelper
  def formatted_breadcrumbs(breadcrumbs)
    separator = "<svg class='flex-shrink-0 mx-2 h-5 w-5 text-gray-400' viewBox='0 0 20 20' fill='currentColor'>
      <path fill-rule='evenodd' d='M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z' clip-rule='evenodd' />
    </svg>"

    breadcrumbs.map do |breadcrumb|
      if breadcrumb[1].present?
        link_to breadcrumb[0], breadcrumb[1], class: 'text-gray-500 hover:text-gray-700 transition duration-150 ease-in-out'
      else
        content_tag(:span, breadcrumb[0], class: 'text-gray-500 hover:text-gray-700 transition duration-150 ease-in-out')
      end
    end.join(separator).html_safe
  end

  def back_link(breadcrumbs)
    breadcrumbs_last_index = breadcrumbs.size - 1

    breadcrumbs.select.with_index do |a, index|
      a.size == 2 && index < breadcrumbs_last_index
    end.last.last
  end
end
