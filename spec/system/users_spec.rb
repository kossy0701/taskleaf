require 'rails_helper'

describe 'ユーザー管理機能', type: :system do
  let!(:admin_user) { FactoryBot.create(:user,
    name: 'admin_user',
    email: 'admin@example.com',
    admin: true
    )}
  let!(:normal_user) { FactoryBot.create(:user,
    name: 'normal',
    email: 'normal@example.com',
    admin: false
    )}


  describe 'ユーザー一覧表示機能のテスト(admin)' do
    context 'admin_userがログインしているとき' do

      before do
        visit login_path
        fill_in 'session_email', with: admin_user.email
        fill_in 'session_password', with: admin_user.password
        click_button 'ログインする'
      end

      it 'ユーザー一覧画面へのリンクが表示される' do
        expect(page).to have_content 'ユーザー一覧'
      end
    end
  end

  describe 'ユーザー一覧表示機能のテスト(normal)' do
    context 'normal_userがログインしているとき' do

      before do
        visit login_path
        fill_in 'session_email', with: normal_user.email
        fill_in 'session_password', with: normal_user.password
        click_button 'ログインする'
      end

      it 'ユーザ一覧画面へのリンクが表示されない' do
        expect(page).to have_no_content 'ユーザー一覧'
      end
    end
  end

  describe 'アクセス権限のテスト' do
    context 'normal_userがユーザー一覧画面にアクセスしたとき' do
      before do
        visit login_path
        fill_in 'session_email', with: normal_user.email
        fill_in 'session_password', with: normal_user.password
        click_button 'ログインする'
      end

      it 'root_pathにリダイレクトする' do
        visit admin_users_path
        expect(page).to have_no_content 'ユーザー一覧'
      end
    end
  end
end
