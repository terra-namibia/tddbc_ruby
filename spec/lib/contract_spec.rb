describe Contract do
  let(:contract_msword){ Wordprocessor.new(:msword) }
  let(:contract_ichitaro){ Wordprocessor.new(:ichitaro) }
  let(:contract_sanshiro){ Spreadsheet.new(:sanshiro) }

  describe "商品リストがあること" do
    it "商品リストにmswordがprice: 18800であること" do
      expect(contract_msword.products[:msword].to_s).to eq "{:price=>18800}"
    end
    it "商品リストにichitaroがprice: 20000であること" do
      expect(contract_ichitaro.products[:ichitaro].to_s).to eq "{:price=>20000}"
    end
    it "商品リストにsanshiroがprice: 5000であること" do
      expect(contract_sanshiro.products[:sanshiro].to_s).to eq "{:price=>5000}"
    end
  end

  describe "商品の契約が成立すること" do
    describe "ワードプロセッサの商品の契約が成立すること" do
      it "sined_onの日付が当日になること" do
        signed = contract_msword.sign
        expect(contract_msword.signed_on).to eq Date.today
      end
      it "revenueが全額認識されること" do
        signed = contract_msword.sign
        expect(contract_msword.revenue).to eq contract_msword.products[:msword][:price]
      end
      it "revenue_recognitionが全額認識されること" do
        signed = contract_msword.sign
        expect(contract_msword.revenue_recognition).to eq contract_msword.products[:msword][:price]
      end
    end

    describe "スプレッドシートの商品の契約が成立すること" do
      it "sined_onの日付が当日になること" do
        signed = contract_sanshiro.sign
        expect(contract_sanshiro.signed_on).to eq Date.today
      end
      it "revenueが全額認識されること" do
        signed = contract_sanshiro.sign
        expect(contract_sanshiro.revenue).to eq contract_sanshiro.products[:sanshiro][:price]
      end
      it "契約後、revenue_recognitionが2/3認識されること" do
        signed = contract_sanshiro.sign
        expect(contract_sanshiro.revenue_recognition).to eq 3_332
      end
      # it "契約30日後、revenue_recognitionが1/3認識されること" do
      #   current_revenue_recognize = contract_sanshiro.revenue_recognition.current_revenue_recognize(date)
      #   expect(contract_sanshiro.revenue_recognition).to eq contract_sanshiro.products[:sanshiro][:price]
      # end
    end

  end


end
