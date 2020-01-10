package kosta.namtang.talkbook;

import kosta.namtang.talkbook.common.CancelCode;
import kosta.namtang.talkbook.core.bill.IamportClient;
import kosta.namtang.talkbook.core.bill.exception.IamportResponseException;
import kosta.namtang.talkbook.core.bill.response.AccessToken;
import kosta.namtang.talkbook.core.bill.response.IamportResponse;
import kosta.namtang.talkbook.model.domain.Book;
import kosta.namtang.talkbook.model.domain.User;
import kosta.namtang.talkbook.model.domain.bill.BillKey;
import kosta.namtang.talkbook.model.domain.bill.PurchaseBook;
import kosta.namtang.talkbook.model.domain.bill.PurchaseOrder;
import kosta.namtang.talkbook.model.domain.bill.PurchasePayment;
import kosta.namtang.talkbook.model.dto.response.PurchaseOrderResponse;
import kosta.namtang.talkbook.repository.bill.BillKeyRepository;
import kosta.namtang.talkbook.service.BookService;
import kosta.namtang.talkbook.service.bill.BillKeySystem;
import kosta.namtang.talkbook.service.bill.PurchaseService;
import kosta.namtang.talkbook.util.JsonUtil;
import lombok.extern.slf4j.Slf4j;
import net.minidev.json.JSONUtil;
import org.junit.Before;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

@SpringBootTest
@Slf4j
public class BillingTests {

    @Autowired
    private PurchaseService purchaseService;
    @Autowired
    private BookService bookService;
    @Autowired
    private BillKeyRepository billKey;

    private IamportClient client;

    @Before
    public void Setup() {
        String test_api_key = "3310717107944454";
        String test_api_secret = "TYVkJ2x8nJd4QZeVJ9oeyWHGkSxzHmdBl9V5ctdzcrE3qSYa2npAj7gEZOeHbsiwBeCNHPnUh1XIUWSW";
        client = new IamportClient(test_api_key, test_api_secret);
    }

    @Test
    void purchaseTest() throws Exception {
        // 구매 책 목록
        List<Book> bookList = bookService.selectAll();
        List<Book> list = new ArrayList<>();
        BigDecimal totalPrice = new BigDecimal(0);
        for(int i = 0 ; i < 10 ; i ++) {
            Book b = bookList.get(i);
            list.add(b);
            totalPrice.add(b.getBookPrice());
        }

        PurchaseOrder order = new PurchaseOrder();
        order.setDeliveryAddress("경기도 판교시");
        PurchasePayment payment = new PurchasePayment();
        payment.setDeliveryComment("잘배송해주세요");
        payment.setReceiverName("강한규");
        payment.setPaymentCode(1);
        payment.setReceiverPhone("111111111");
        payment.setShippingPrice(new BigDecimal("10000"));
        payment.setTotalPrice(totalPrice);
        User user = new User();
        user.setUserIdx(1L);

        BillKey key = purchaseService.insertPurchase(list, order, payment, user, "");
        assertNotNull(key);
    }

    @Test
    void orderListTest() throws Exception {

        User user = new User();
        user.setUserIdx(1);
        List<PurchaseOrderResponse> list = purchaseService.selectOrderList(user);
        String json = JsonUtil.toJson(list);

        log.debug(json);
    }

    @Test
    void refundTest() throws Exception {
        //String billKey, String reason, int refundCode, List<Long> purchaseBookIdsList

        BillKey key = purchaseService.refund("60bd18ad-a343-48b1-bfd9-093a5879c414", "개구려서"
                , CancelCode.Buyer.getValue(), new ArrayList<PurchaseBook>() );

        assertNotNull(key);
    }

    @Test
    void getTokenTest() throws IOException, IamportResponseException {
        // client 설정
        this.Setup();
        IamportResponse<AccessToken> auth_response = client.getAuth();
        String token = auth_response.getResponse().getToken();

        String json = JsonUtil.toJson(auth_response.getResponse());
        log.debug(json);

        //if(get)


    }

}
