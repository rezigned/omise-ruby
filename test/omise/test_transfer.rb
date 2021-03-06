require "support"

class TestTransfer < Omise::Test
  setup do
    @transfer = Omise::Transfer.retrieve("trsf_test_4yqacz8t3cbipcj766u")
  end

  def test_that_we_can_create_a_transfer
    transfer = Omise::Transfer.create

    assert_instance_of Omise::Transfer, transfer
  end

  def test_that_we_can_retrieve_a_transfer
    assert_instance_of Omise::Transfer, @transfer
    assert_equal "trsf_test_4yqacz8t3cbipcj766u", @transfer.id
  end

  def test_that_we_can_update_a_transfer
    @transfer.update(amount: 192189)

    assert_equal 192189, @transfer.amount
  end

  def test_that_we_can_destroy_a_transfer
    @transfer.destroy

    assert @transfer.deleted
    assert @transfer.destroyed?
  end

  def test_that_we_can_list_all_transfer
    transfers = Omise::Transfer.list

    assert_instance_of Omise::List, transfers
  end

  def test_that_a_transfer_has_a_recipient
    assert_instance_of Omise::Recipient, @transfer.recipient
  end

  def test_that_a_transfer_has_a_bank_account
    assert_instance_of Omise::BankAccount, @transfer.bank_account
  end

  def test_that_search_returns_a_scoped_search
    assert_instance_of Omise::SearchScope, Omise::Transfer.search
    assert_equal "transfer", Omise::Transfer.search.scope
  end

  def test_that_schedule_returns_a_scheduler
    assert_instance_of Omise::Scheduler, Omise::Transfer.schedule
    assert_equal "transfer", Omise::Transfer.schedule.type
  end
end
