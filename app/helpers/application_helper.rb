module ApplicationHelper
  def embedded_svg filename, options={}
   file = File.read(Rails.root.join('app', 'assets', 'images', filename))
   doc = Nokogiri::HTML::DocumentFragment.parse file
   svg = doc.at_css 'svg'
   if options[:class].present?
     svg['class'] = options[:class]
   end
   if options[:width].present?
     svg['width'] = options[:width]
   end
   if options[:height].present?
     svg['height'] = options[:height]
   end
   if options[:viewBox].present?
     svg['viewBox'] = options[:viewBox]
   end
   if options[:role].present?
     svg['role'] = options[:role]
   end
   doc.to_html.html_safe
 end
end
