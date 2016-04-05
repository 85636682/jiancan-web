module U1
  class Bookings < Grape::API
    resource :bookings do
      desc '获取用户预定'
      params do
        requires :bookingable_type, type: String, desc: '对象名'
      end
      get '', each_serializer: BookingSerializer, root: false do
        authenticate!
        @bookings = current_user.bookings.where(bookingable_type: params[:bookingable_type])
      end

      desc '添加用户评论'
      params do
        requires :booking, type: Hash do
          requires :shop_id, type: Integer, desc: '店铺id'
          requires :booking_time, type: String, desc: '预定时间'
          requires :bookingable_id, type: Integer, desc: '对象id'
          requires :bookingable_type, type: String, desc: '对象名'
        end
      end
      post '', serializer: BookingSerializer, root: false do
        authenticate!
        @booking = Booking.new(params[:booking])
        @booking.user_id = current_user.id
        if @booking.save
          render @booking
        else
          error!({ error: "留言失败！" }, 400)
        end
      end

    end
  end
end
