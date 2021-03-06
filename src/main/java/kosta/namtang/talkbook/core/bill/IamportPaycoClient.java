package kosta.namtang.talkbook.core.bill;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

import kosta.namtang.talkbook.core.bill.exception.IamportResponseException;
import kosta.namtang.talkbook.core.bill.request.payco.OrderStatusData;
import kosta.namtang.talkbook.core.bill.response.AccessToken;
import kosta.namtang.talkbook.core.bill.response.IamportResponse;
import kosta.namtang.talkbook.core.bill.response.payco.OrderStatus;

import okhttp3.OkHttpClient;
import retrofit2.Call;
import retrofit2.HttpException;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class IamportPaycoClient extends IamportClient {

    private PaycoImpl paycoImpl;

    public IamportPaycoClient(String api_key, String api_secret) {
        super(api_key, api_secret);
        this.paycoImpl = this.createImpl();
    }

    private PaycoImpl createImpl() {
        OkHttpClient client = new OkHttpClient.Builder()
                .readTimeout(30, TimeUnit.SECONDS)
                .connectTimeout(10, TimeUnit.SECONDS)
                .build();

        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl(API_URL)
                .addConverterFactory(GsonConverterFactory.create())
                .client(client)
                .build();

        return retrofit.create(PaycoImpl.class);
    }

    public IamportResponse<OrderStatus> updateOrderStatus(String impUid, String status) throws IamportResponseException, IOException {
        AccessToken auth = getAuth().getResponse();
        Call<IamportResponse<OrderStatus>> call = this.paycoImpl.updateStatus(auth.getToken(), impUid, new OrderStatusData(status));

        Response<IamportResponse<OrderStatus>> response = call.execute();
        if (!response.isSuccessful())
            throw new IamportResponseException(getExceptionMessage(response), new HttpException(response));

        return response.body();
    }

}
