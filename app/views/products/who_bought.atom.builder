atom_feed do |feed|
  feed.title "Кто купил #{@product.name}"

  latest_order = @product.orders.sort_by(&:updated_at).last
  feed.updated( latest_order && latest_order.updated_at )

  @product.orders.each do |order|
    feed.entry(order) do |entry|
      entry.title "Заказ #{order.id}"
      entry.summary type: 'xhtml' do |xhtml|
        xhtml.p "Адрес: #{order.address}"

        xhtml.table do
          xhtml.tr do
            xhtml.th "Продукт"
            xhtml.th "Количество"
            xhtml.th "Итоговая цена"
          end

          order.line_items.each do |item|
            xhtml.tr do
              xhtml.td item.product.name
              xhtml.td item.quantity
              xhtml.td item.total_price
            end
          end 

          xhtml.tr do
            xhtml.th "Итого", colspan: 2
            xhtml.th order.line_items.map(&:total_price).sum
          end
        end

        xhtml.p "Форма оплаты: #{order.pay_type}"
      end
      entry.author do |author|
        entry.name order.name
        entry.email order.email
      end
    end
  end
end
