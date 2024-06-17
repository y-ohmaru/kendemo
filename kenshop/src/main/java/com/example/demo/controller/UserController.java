package com.example.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.Dao.UsersDao;
import com.example.demo.model.UserModel;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UsersDao usersDao;

	// ログインフォーム表示
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String showLoginForm(Model model, HttpSession session) {
		model.addAttribute("userModel", new UserModel());
		return "login";
	}

	// ログイン処理
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@Validated @ModelAttribute UserModel userModel, BindingResult result, Model model, HttpSession session) {
		if (result.hasErrors()) {
			return "login";
		}

		// 認証ロジックをここに追加
		UserModel user = usersDao.login_check(userModel.getUsername(), userModel.getPassword());
		if (user != null) {
			session.setAttribute("userModel", user);  // セッションにユーザーモデルを保存
			return "redirect:/";  // ログイン後の遷移先

		} else {
			model.addAttribute("loginError", "ユーザー名またはパスワードが違います。");
			return "login";
		}
	}

	// ログアウト処理
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {

	    session.invalidate();  // セッションを無効化
		return "logout";  // topページにリダイレクト
	}



	// 登録フォーム表示
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public String registForm(Model model) {
		model.addAttribute("userModel", new UserModel());
		return "regist";
	}

	// ユーザー登録処理
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String registUser(@Validated @ModelAttribute UserModel userModel, BindingResult result, Model model, HttpSession session) {
		if (result.hasErrors()) {
			return "regist";
		}

		// ユーザー登録
		usersDao.add(userModel);

		// セッションにユーザー情報を保存
		session.setAttribute("userModel", userModel);

		// 登録後の遷移先
		return "redirect:/";
	}
}
