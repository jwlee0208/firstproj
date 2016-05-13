<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
						<blockquote>
							<b>별 : {{reviewCtrl.review.stars}}</b>
							{{reviewCtrl.review.comment}}
							<cite class="clearfix">by : {{reviewCtrl.review.author}}</cite>
						</blockquote>
						<h4>Submit a review</h4>
						<fieldset class="form-group">
							<select class="form-control" 
									ng-options="stars for stars in [5,4,3,2,1]" 
									title="Stars" 
									ng-model="reviewCtrl.review.stars"
									required>
								<option value="">Rate the product</option>
								<option value="1">1 Star</option>
								<option value="2">2 Stars</option>
								<option value="3">3 Stars</option>
								<option value="4">4 Stars</option>
								<option value="5">5 Stars</option>
							</select>						
						</fieldset>
						<fieldset class="form-group">
							<textarea class="form-control" placeholder="리뷰를 입력해 주세요." title="Review" ng-model="reviewCtrl.review.comment" class="ng-pristine ng-valid" required></textarea>
						</fieldset>
						<fieldset class="form-group">
							<!-- Source before typing, with valid email  -->	
							<input type="email" class="form-control" placeholder="이메일을 입력해 주세요." ng-model="reviewCtrl.review.author" name="author" class="ng-pristine ng-valid" required/>
							<!-- Source after typing, with invalid email  -->
<!-- 							<input type="email" class="form-control" placeholder="이메일을 입력해 주세요." ng-model="reviewCtrl.review" name="author" class="ng-dirty ng-invalid" required/> -->
							<div>ReviewForm is {{reviewForm.$valid}}</div>
						</fieldset>				
						<fieldset class="form-group">
							<input type="submit" value="Submit Review" class="btn btn-primary pull-right"/>	
						</fieldset>	